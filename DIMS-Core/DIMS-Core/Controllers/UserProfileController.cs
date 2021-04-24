﻿using System.Collections.Generic;
using System.Threading.Tasks;
using AutoMapper;
using DIMS_Core.BusinessLayer.Interfaces;
using DIMS_Core.BusinessLayer.Models;
using DIMS_Core.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;

namespace DIMS_Core.Controllers
{
    [Route("users")]
    public class UserProfileController : BaseController
    {
        private readonly IUserProfileService _userProfileService;
        private readonly IVUserProfileService _vUserProfileService;

        public UserProfileController(IMapper mapper,
                                     IUserProfileService userProfileService,
                                     IVUserProfileService vUserProfileService,
                                     ILogger<UserProfileController> logger) : base(mapper, logger)
        {
            _userProfileService = userProfileService;
            _vUserProfileService = vUserProfileService;
        }

        public async Task<ActionResult> Index()
        {
            var readOnlyModels = await _vUserProfileService.GetAll();
            var viewModels = Mapper.Map<IEnumerable<VUserProfileViewModel>>(readOnlyModels);

            return View(viewModels);
        }

        [HttpGet("details/{id:int}")]
        public async Task<ActionResult> Details(int id)
        {
            var userProfile = await _userProfileService.GetById(id);

            var userProfileViewModel = Mapper.Map<UserProfileViewModel>(userProfile);

            return View(userProfileViewModel);
        }

        [HttpGet("create")]
        public ActionResult Create()
        {
            return View();
        }

        [HttpPost("create")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(UserProfileViewModel userProfileViewModel)
        {
            if (!ModelState.IsValid)
            {
                return View(userProfileViewModel);
            }

            var userProfileEntity = Mapper.Map<UserProfileModel>(userProfileViewModel);

            var userProfile = await _userProfileService.Create(userProfileEntity);

            if (userProfile != null)
            {
                return RedirectToAction(nameof(Index));
            }

            return View(userProfileViewModel);
        }

        [HttpGet("edit/{id:int}")]
        public async Task<IActionResult> Edit(int id)
        {
            var userProfile = await _userProfileService.GetById(id);

            var userProfileViewModel = Mapper.Map<UserProfileViewModel>(userProfile);

            return View(userProfileViewModel);
        }

        [HttpPost("edit/{id:int}")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(UserProfileViewModel userProfileViewModel)
        {
            if (!ModelState.IsValid)
            {
                return View(userProfileViewModel);
            }

            var userProfileEntity = Mapper.Map<UserProfileModel>(userProfileViewModel);

            var userProfile = await _userProfileService.Update(userProfileEntity);

            if (userProfile != null)
            {
                return RedirectToAction(nameof(Index));
            }

            return View(userProfileViewModel);
        }

        [HttpGet("delete/{id:int}")]
        public IActionResult Delete(int id)
        {
            return View();
        }

        [HttpPost("delete/{id:int}")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteUser(int id)
        {
            await _userProfileService.Delete(id);

            return RedirectToAction(nameof(Index));
        }
    }
}