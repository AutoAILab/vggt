# Notes

## Scripts
- `demo_script.py` : Sample code
- `docker_build.sh` : Build docker environment
- `docker_run.sh` : Run docker environment

## Commands
- `python3 demo_colmap.py --scene_dir ./examples/llff_fern/` : Run Colmap demo
- `python3 demo_colmap.py --scene_dir ./examples/llff_flower/ --use_ba` : Run Colmap demo using Bundle Adjustment


## Observations
### Examples
- kitchen : Success with default settings
- llff_fern : Success with default settings
- llff_fern : Did not produce result when default values used. Moderate result produced when bundle adjustment enabled (0.206 [minutes])
- room : Success with default settings
- icar_demo : Success with default settings

