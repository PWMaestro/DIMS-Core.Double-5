﻿using System.Collections.Generic;
using System.Threading.Tasks;
using DIMS_Core.BusinessLayer.Models;

namespace DIMS_Core.BusinessLayer.Interfaces
{
    public interface IDirectionService
    {
        Task<DirectionModel> Create(DirectionModel direction);

        Task<DirectionModel> GetById(int id);

        Task<IEnumerable<DirectionModel>> GetAll();

        Task<DirectionModel> Update(DirectionModel direction);

        Task Delete(int id);
    }
}