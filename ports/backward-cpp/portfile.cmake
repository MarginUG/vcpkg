# Header-only library
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO bombela/backward-cpp
    REF 295c229d693706ed336f0535cdc93dfaca7dfb2d # master
    SHA512 96224113619af1e64812c430b3ddc6abb51026519d4394e9b243014e93519b719b657c32bda41eea1f817523b1b8b41143938e5b79119232bc792297675377cf
    HEAD_REF master
)

file(
    COPY ${SOURCE_PATH}/backward.hpp
    DESTINATION ${CURRENT_PACKAGES_DIR}/include
)

# Handle copyright
file(INSTALL ${SOURCE_PATH}/LICENSE.txt DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT} RENAME copyright)
