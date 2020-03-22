from setuptools import setup

install_requires = []
test_requires = ["pytest", "pytest-cov"]
lint_requires = ["black", "flake8", "pylint"]
docs_requires = []

setup(
    name="catan",
    author="Gaurav Pikale",
    package_dir={"": "src"},
    packages=["catan"],
    install_requires=install_requires,
    include_package_data=True,
    extras_require={
        "test": test_requires,
        "docs": docs_requires,
        "lint": lint_requires,
        "dev": test_requires + lint_requires + docs_requires,
    },
)
