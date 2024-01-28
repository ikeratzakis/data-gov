from setuptools import setup, find_packages

setup(
    name='data-gov',
    version='0.1',
    packages=find_packages(),
    install_requires=[
        "requests==2.31.0",
        "orjson==3.9.12",
        "mysql-connector-python==8.3.0"
    ],
)