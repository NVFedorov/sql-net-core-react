using System.Collections.Generic;
using System.Threading.Tasks;

namespace SPAExample.DAL.Repository
{
    public interface IRepository<T>
    {
        // other CRUD operations should be defined here, but they are redundant for the assessments, therefore omitted

        Task<List<T>> Get();
    }
}
