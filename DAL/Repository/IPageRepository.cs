using System.Collections.Generic;
using System.Threading.Tasks;
using SPAExample.DAL.DTO;

namespace SPAExample.DAL.Repository
{
    public interface IPageRepository : IRepository<PageDTO>
    {
        Task<List<PageDTO>> GetByRoles(string roles);
    }
}
