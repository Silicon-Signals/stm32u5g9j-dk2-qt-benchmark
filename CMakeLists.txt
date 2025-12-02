cmake_minimum_required (VERSION 3.21.1)

project(stm32u5g9j_dk2_qt_benchmark VERSION 0.0.1 LANGUAGES C CXX ASM)

find_package(Qul)

qul_add_target(stm32u5g9j_dk2_qt_benchmark QML_PROJECT stm32u5g9j_dk2_qt_benchmark.qmlproject)

target_link_libraries(stm32u5g9j_dk2_qt_benchmark PRIVATE Qul::PlatformBSPConfig)
target_compile_definitions(PlatformBSPConfig INTERFACE
  USE_HAL_DRIVER
)

add_compile_options(-mfpu=fpv5-sp-d16 -mfloat-abi=hard)
add_link_options(-mfpu=fpv5-sp-d16 -mfloat-abi=hard)

target_include_directories(PlatformBSPConfig INTERFACE
  ${QUL_BOARD_SDK_DIR}/Drivers/BSP/STM32U5G9J-DK2
)

target_sources(stm32u5g9j_dk2_qt_benchmark
  PRIVATE
  main.cpp
)

app_target_setup_os(stm32u5g9j_dk2_qt_benchmark)
