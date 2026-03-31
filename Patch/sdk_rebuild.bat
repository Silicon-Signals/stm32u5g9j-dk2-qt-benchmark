rem Path to store QtForMCUs SDK
set QUL_ROOT=C:\Qt\QtMCUs\stm32u5x9-discovery-freertos-2.11.1
rem Path of compiler
set TOOLCHAIN=C:\Qt\Tools\QtMCUs\arm_gcc_12_3_1
rem Path of STM SDK
set STM_SDK=C:\Qt\Tools\QtMCUs\STM\STM32Cube_FW_U5_V1.7.0

cd %QUL_ROOT%
mkdir build
cd build

cmake .. -G "Ninja" -DQul_ROOT=%QUL_ROOT% -DCMAKE_BUILD_TYPE=Release -DCMAKE_TOOLCHAIN_FILE=%QUL_ROOT%\lib\cmake\Qul\toolchain\armgcc.cmake -DQUL_PLATFORM=stm32u5x9-discovery-freertos -DQUL_TARGET_TOOLCHAIN_DIR=%TOOLCHAIN% -DQUL_BOARD_SDK_DIR=%STM_SDK% -DQUL_BUILD_DEMOS=off -DQUL_BUILD_EXAMPLES=off -DQUL_BUILD_FRAMEWORK=on -DCMAKE_INSTALL_PREFIX=%QUL_ROOT%  -DQUL_GENERATORS=%QUL_ROOT%/lib/cmake/Qul/QulGenerators.cmake -DQUL_COLOR_DEPTH=16 -DFREERTOS_DIR:STRING=%QUL_ROOT%\platform\boards\st\stm32u5x9-discovery-freertos\3rdparty\FreeRTOS\Source -DQUL_VERSION=2.11 -DQUL_ENABLE_PERFORMANCE_LOGGING=off -DQUL_ENABLE_PERFORMANCE_CONSOLE_OUTPUT=off -DQUL_PLATFORM_ENABLE_NEMA_DRAWING_ENGINE=on

cmake --build .
pause
cmake --install .
