from collections.abc import Generator

from fastapi.testclient import TestClient
from pytest import fixture

from seravo.common.app import create_app


class BaseTestSuite:
    """Common operations to be used in testing"""

    @fixture
    def client(self) -> Generator[TestClient, None, None]:
        """Return an API client for testing purposes"""
        app = create_app()
        yield TestClient(app)
