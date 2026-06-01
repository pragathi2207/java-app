using Xunit;
using Microsoft.AspNetCore.Mvc.Testing;

namespace HelloDotnetApp.Tests;

public class UnitTest1 : IClassFixture<WebApplicationFactory<Program>>
{
    private readonly WebApplicationFactory<Program> _factory;

    public UnitTest1(WebApplicationFactory<Program> factory)
    {
        _factory = factory;
    }

    [Fact]
    public async Task Get_Root_Returns_Success()
    {
        var client = _factory.CreateClient();
        var response = await client.GetAsync("/");
        response.EnsureSuccessStatusCode();
    }

    [Fact]
    public void Sample_Unit_Test_Pass()
    {
        var result = 1 + 1;
        Assert.Equal(2, result);
    }
}