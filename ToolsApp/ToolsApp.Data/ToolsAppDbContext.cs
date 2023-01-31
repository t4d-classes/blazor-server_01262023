using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using ToolsApp.Data.Models;

namespace ToolsApp.Data
{
  public class ToolsAppDbContext : DbContext
  {
    public ToolsAppDbContext(DbContextOptions<ToolsAppDbContext> options) : base(options) { }

    public DbSet<Color> Colors { get; set; }
    public DbSet<Car> Cars { get; set; }
  }
}