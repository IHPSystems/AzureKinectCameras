# AzureKinectCameras

This package aims to provide a [Julia](https://julialang.org) interface to the Microsoft [Azure Kinect Sensor SDK](https://github.com/Microsoft/Azure-Kinect-Sensor-SDK) - in the form of a [Cameras](https://github.com/IHPSystems/Cameras.jl) implementation.

## Wrapper generator

```
docker build -t azure_kinect_cameras .

docker run -it --rm -v `pwd`:/project azure_kinect_cameras julia -e 'import Pkg; cd(joinpath("src", "wrapper_generator")); Pkg.activate("."); include("generator.jl")'
```
