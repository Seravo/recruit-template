from .test_00_base import BaseTestSuite


class TestCommon(BaseTestSuite):
    """Test the common operations of the API"""

    def test_api_root(self, client) -> None:
        """Test that the API root returns content"""
        res = client.get("/")
        assert res.status_code == 200
        assert res.json().get('detail') == "Seravo API"
