# Seravo development team recruit template

_We are currently not hiring, but you can still clone the repository, give the tasks a spin, and send us an open application at careers@seravo.com._

## Using the supplied Docker environment with Makefile

If you have Docker installed, and are familiar with the `make` command, you can use the following commands to start the development environment.

### Usage

Run `make develop` to start the container. You can access the API at `localhost:8080`.

### Reloading changes

Run `make reload` to reload the gunicorn workers. If you think that your changes are not reflected in the application after the reload, you can run `make develop` again.

### Cleanin up

Run `make purge` to remove the container.

### Tests

You can use `make test` to execute tests inside the container.

## Running FastAPI from the terminal

Alternatively, you can also run the application from your terminal with `uvicorn`. See [FastAPI docs](https://fastapi.tiangolo.com/#installation) on how to install the required packages.

Remember to also install the dependencies defined in `requirements.txt`!

```console
pip install -r requirements.txt
```

Finally, run `uvicorn seravo.main:app --reload` to start our base application.

You can run the tests with `pytest -vv tests`, granted you have `pytest` installed.

## The tasks

The tasks should be possible to implement with the given packages in `requirements.txt`. If you want to use a new package (e.g. `requests` instead of `httpx`), you can just add it to the requirements file and use it in your code.

1. Create a new endpoint `/pokemon/{name}`, which can be accessed with a GET request.

   - When triggered, the application queries `https://pokeapi.co/api/v2/pokemon/{name}/` for a JSON blob about the chosen pokemon
   - Application should handle possible errors
   - Data should be modified to match the following structure:

   ```python
    name: str
    height: int
    weight: int
    types: List[str]
   ```

   - Application returns the modifed JSON blob to the user
   - So, for example, `/pokemon/pikachu` would return this:

   ```json
   {
     "name": "pikachu",
     "height": 4,
     "weight": 60,
     "types": ["electric"]
   }
   ```

2. Create a new endpoint `/caps/`, which can be accessed with a POST request.

   - Endpoint can be queried with the following body:

   ```json
   {
     "message": "string"
   }
   ```

   - The API will return the content of the `message` field in all CAPS.
   - The API should reject the request if the body does not match the one above
   - The API should reject the request if there already is a capitalized letter in the data

### Grading

We will give points based on the following criteria:

1. Code readability, code documentation, version control
2. Code structure: is everything bundled in a single file or distributed
3. Error handling: HTTP status codes
4. Test coverage: Were the tests extended to test the new features.

### Helpful links

[Path parameters](https://fastapi.tiangolo.com/tutorial/path-params/)

[Request body](https://fastapi.tiangolo.com/tutorial/body/)

[HTTPX QuickStart](https://www.python-httpx.org/quickstart/)

[HTTPX Async](https://www.python-httpx.org/async/)

[Pydantic validators](https://docs.pydantic.dev/usage/validators/)

[Test mocking](https://docs.pytest.org/en/6.2.x/monkeypatch.html#monkeypatching-returned-objects-building-mock-classes)

## Submitting your work

Set up a private repository with your modifications, share it to @seravo-hrm and notify us at careers@seravo.com with your application and we will get back to you as soon as possible!
