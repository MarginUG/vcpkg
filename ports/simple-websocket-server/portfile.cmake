include(vcpkg_common_functions)

vcpkg_from_gitlab(
    GITLAB_URL https://gitlab.com
    OUT_SOURCE_PATH SOURCE_PATH
    REPO eidheim/Simple-WebSocket-Server
    REF 5597ea9852829922a5bb4106fcfaf11ac16c052a
    SHA512 c14b0c0b29ffa7ae1a3efc460259e31d00dc6e5cd4673704eb102c86bbd2cfdc89bda6d372dc976f1e7eefa42ff21a5177c74780dbe04170d1c97fae97e923bc
    HEAD_REF master
)

file(COPY ${CMAKE_CURRENT_LIST_DIR}/CMakeLists.txt DESTINATION ${SOURCE_PATH})

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
    OPTIONS
        -DUSE_STANDALONE_ASIO:BOOL=ON
)
vcpkg_install_cmake()

# Remove duplicate includes
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug)

# Put the licence file where vcpkg expects it
file(COPY ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/simple-websocket-server)
file(RENAME ${CURRENT_PACKAGES_DIR}/share/simple-websocket-server/LICENSE ${CURRENT_PACKAGES_DIR}/share/simple-websocket-server/copyright)