using System.Collections.Generic;

namespace AS
{
    public interface IBaseRepository<TEntity>
    {
        List<TEntity> GetAll();
        TEntity GetById(int id);
        void Create(TEntity entity);
        void Update(TEntity entity);
        void Delete(int id);
    }
}
