cmake_minimum_required (VERSION 3.21.1)

project(stm32u5g9j_dk2_qt_benchmark VERSION 0.0.1 LANGUAGES C CXX ASM)

find_package(Qul)

qul_add_target(stm32u5g9j_dk2_qt_benchmark QML_PROJECT stm32u5g9j_dk2_qt_benchmark.qmlproject GENERATE_ENTRYPOINT)

target_sources(stm32u5g9j_dk2_qt_benchmark
  PRIVATE

)

app_target_setup_os(stm32u5g9j_dk2_qt_benchmark)
