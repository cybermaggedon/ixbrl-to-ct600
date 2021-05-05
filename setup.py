import setuptools

with open("README.md", "r") as fh:
    long_description = fh.read()

setuptools.setup(
    name="ixbrl-to-ct600",
    version="1.1",
    author="Cybermaggedon",
    author_email="mark@cyberapocalypse.co.uk",
    description="iXBRL to CT600 form",
    long_description=long_description,
    long_description_content_type="text/markdown",
    url="https://github.com/cybermaggedon/ixbrl-to-ct600",
    packages=setuptools.find_packages(),
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: GNU General Public License v3 or later (GPLv3+)",
        "Operating System :: OS Independent",
    ],
    python_requires='>=3.6',
    install_requires=[
    ],
    scripts=[
        "scripts/ixbrl-to-ct600"
    ]
)
