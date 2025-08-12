import asyncio
from mcp.server import Server
from mcp.server.stdio import stdio_server
from mcp.types import TextContent

server = Server("realconvo")

@server.tool()
async def ping() -> list[TextContent]:
    return [TextContent(type="text", text="pong")]

async def main():
    async with stdio_server() as (read, write):
        await server.run(read, write)

if __name__ == "__main__":
    asyncio.run(main())
