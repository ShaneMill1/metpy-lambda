FROM lambci/lambda:build-python3.8

# Install python packages we want

RUN pip install --upgrade xarray zarr dask netCDF4 -t python/
RUN export PYTHONPATH=/var/task/python:$PYTHONPATH; LD_LIBRARY_PATH=/var/task/lib:$LD_LIBRARY_PATH; export PATH=/var/task/bin:$PATH;

# Shrink layer size by stripping libraries and removing unnecessary files

RUN find python/numpy -name "*.so" | xargs strip
RUN find python/pandas -name "*.so" | xargs strip
RUN rm -rf lib/*.a python/setuptools/*.exe python/pandas/tests python/scipy/stats/tests python/matplotlib/tests python/pyarrow/tests python/mpl_toolkits/tests python/scipy/linalg/tests python/numpy/tests

# Package the layer up into a zip file we can extract

RUN zip -r9 "edr_layer.zip" ./python ./lib

