var builder = WebApplication.CreateBuilder(args);

builder.Services.AddControllers();

var app = builder.Build();

app.UseRouting();

app.MapControllers();

app.MapGet("/", () => "Hello from .NET Core IIS Application!");

app.Run();