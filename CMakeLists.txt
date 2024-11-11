cmake_minimum_required(VERSION 3.10)

project(action_test LANGUAGES C)

enable_testing()

add_executable(action_test main.c)
set_target_properties(action_test PROPERTIES
	RUNTIME_OUTPUT_DIRECTORY_DEBUG ${CMAKE_SOURCE_DIR}/bin/action_test/${ARCH}-Debug/
	RUNTIME_OUTPUT_DIRECTORY_RELEASE ${CMAKE_SOURCE_DIR}/bin/action_test/${ARCH}-Release/
)
add_test(action_build "${CMAKE_COMMAND}" --build ${CMAKE_BINARY_DIR} --config ${CMAKE_BUILD_TYPE} --target action_test)
add_test(action ${CMAKE_SOURCE_DIR}/bin/action_test/${ARCH}-${CMAKE_BUILD_TYPE}/action_test)
set_tests_properties(action PROPERTIES DEPENDS action_build)
