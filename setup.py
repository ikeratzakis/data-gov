from setuptools import setup, find_packages

setup(
    name="data-gov",
    version="0.0.1",
    packages=find_packages(),
    install_requires=[
        "orjson==3.9.13",
        "mysql-connector-python==8.3.0",
        "aiohttp==3.9.3",
        "pytest=8.0.0",
        "pytest-asyncio 0.23.5"
    ],
)
