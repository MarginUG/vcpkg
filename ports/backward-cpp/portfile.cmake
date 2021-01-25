# Header-only library
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO bombela/backward-cpp
    REF f6f7253656159f225b88e03d38b2dec52f1e6258 # master
    SHA512 6b715ea7cec4392423e2a230957ba91846e8b1002fa30410c24a2ea80c9cc0c867a804780a9a30ad190fdee94b0e0830633adf00a29be177b73f31fe137d8ad9
    HEAD_REF master
)

file(
    COPY ${SOURCE_PATH}/backward.hpp
    DESTINATION ${CURRENT_PACKAGES_DIR}/include
)

# Handle copyright
file(INSTALL ${SOURCE_PATH}/LICENSE.txt DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT} RENAME copyright)
