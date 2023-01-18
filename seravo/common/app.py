from fastapi import FastAPI


def create_app() -> FastAPI:
    """Create a FastAPI application"""
    app = FastAPI()

    @app.get("/")
    async def root():
        """Return API information"""
        return {'detail': "Seravo API"}

    return app
