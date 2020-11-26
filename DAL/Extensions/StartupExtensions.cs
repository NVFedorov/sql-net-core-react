using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using SPAExample.DAL.Repository;
using SPAExample.DAL.Repository.Impl;
using SPAExample.DAL.Services;
using SPAExample.DAL.Services.Impl;
using SPAExample.Settings;

namespace SPAExample.DAL.Extensions
{
    public static class StartupExtensions
    {
        public static IServiceCollection AddSqlServer(this IServiceCollection services, IConfiguration config)
        {
            services.Configure<DatabaseSettings>(config.GetSection(nameof(DatabaseSettings)));
            services.AddSingleton<IDBConnectionFactory, DBConnectionFactory>();
            services.AddScoped<IProductRepository, ProductRepository>();
            services.AddScoped<IPageRepository, PageRepository>();

            services.AddScoped(typeof(IRepository<>), typeof(Repository<>));

            return services;
        }
    }
}
