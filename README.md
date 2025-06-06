# 水文工程计算工具集

## 项目内容

### Fortran 程序
- `difference_equation.f90`: 地下水渗流模拟程序
  - 使用有限差分法求解二维地下水渗流方程
  - 考虑不同区域的渗透系数（岩体和帷幕）
  - 设置第一类和第二类边界条件
  - 通过迭代法求解水头分布
  - 结果输出到 `test.dat` 文件
  - 应用场景：水利工程、地下水工程等领域的水头分布计算

- `resultOutput.f90`: 数据输出格式化程序
  - 创建 3×2 的二维数组
  - 将数组数据以格式化方式写入 `data.dat` 文件
  - 每行输出两个数值
  - 应用场景：需要将数据以特定格式输出的情况

## 使用说明

### Fortran 程序
1. 确保已安装 Fortran 编译器（如 gfortran）
2. 编译命令示例：
   ```bash
   gfortran difference_equation.f90 -o difference_equation
   ```
3. 运行编译后的程序：
   ```bash
   ./difference_equation
   ```

## 许可证
MIT License
