vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

SET(VCPKG_POLICY_ONLY_RELEASE_CRT enabled)
set(VCPKG_POLICY_SKIP_ARCHITECTURE_CHECK enabled)

# This is a workaround to get our rustup installation into the build environment
find_program(RUST_COMPILER rustc PATHS $ENV{HOME}/.cargo/bin)
get_filename_component(RUST_TOOLCHAIN ${RUST_COMPILER} DIRECTORY)
vcpkg_add_to_path(${RUST_TOOLCHAIN})

vcpkg_from_git(
    OUT_SOURCE_PATH SOURCE_PATH
    URL https://github.com/MarginUG/openlimits-cpp.git
    REF 5f1e110af73f9bbc0d31a71baddf3e69d73eb476
)
# set(SOURCE_PATH "/home/marvin/sources/openlimits-cpp")
# Use openlimit-cpp's own build process
vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
)
vcpkg_install_cmake()

vcpkg_fixup_cmake_targets(CONFIG_PATH lib/cmake)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT} RENAME copyright)
# file(INSTALL ${CMAKE_CURRENT_LIST_DIR}/usage DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT})
