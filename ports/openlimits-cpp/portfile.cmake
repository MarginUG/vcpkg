include(vcpkg_common_functions)

# vcpkg_from_github(
#     OUT_SOURCE_PATH SOURCE_PATH
#     REPO nash-io/openlimits-cpp
#     REF 3b638e67150783303aebf1fc0789d6c44a026b53
#     SHA512 743ff74448c1ac31d1d03c90aa50cd6119b9e1723e618d0ca1f6021ec8a5282b34e1fc13b8577d7cf9eee064b6d9f809b0c92fdc09581c96dfd69cf7b7805223
#     HEAD_REF master
# )

set(SOURCE_PATH "/home/marvin/sources/openlimits-cpp")
# Use openlimit-cpp's own build process, skipping examples and tests
vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
)
vcpkg_install_cmake()

vcpkg_fixup_cmake_targets(CONFIG_PATH lib/cmake)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT} RENAME copyright)
# file(INSTALL ${CMAKE_CURRENT_LIST_DIR}/usage DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT})
