# IPOPT

内点法を用いた制約つき非線形最適化ソフトウェアパッケージ

## Repository
https://github.com/coin-or/Ipopt

## Install
```
bash install_ipopt.sh
```

## Example

$$
\underset{x}{\min}  \space (x) = -(x_2-2)^2 \\
\text{s.t. } 0 = x_1^2 + x_2 - 1 \\
            -1 <= x_1 <= 1
$$

```
sh run_example.sh
```