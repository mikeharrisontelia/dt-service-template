"""
Template FastMCP Service

Replace this with your actual service implementation.
"""

import fastmcp

# Create MCP server instance
app = fastmcp.FastMCP("{{SERVICE_NAME}}")

@app.tool()
def hello_world(name: str) -> str:
    """
    A simple hello world function.
    
    Args:
        name: The name to greet
        
    Returns:
        A greeting message
    """
    return f"Hello, {name}! This is {{SERVICE_NAME}} service."

@app.tool()
def health_check() -> dict:
    """
    Health check endpoint.
    
    Returns:
        Service health status
    """
    return {
        "status": "healthy",
        "service": "{{SERVICE_NAME}}",
        "version": "1.0.0"
    }

if __name__ == "__main__":
    # This will be called when running with fastmcp
    pass