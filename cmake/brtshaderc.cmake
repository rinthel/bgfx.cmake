
if( NOT IS_DIRECTORY ${BRTSHADERC_DIR} )
    message( SEND_ERROR "Could not load brtshaderc_dir, directory does not exist. ${BRTSHADERC_DIR}" )
    return()
endif()

add_library( brtshaderc
    ${BRTSHADERC_DIR}/tools/brtshaderc/brtshaderc.cpp
    ${BRTSHADERC_DIR}/tools/brtshaderc/brtshaderc.h
    ${BRTSHADERC_DIR}/tools/brtshaderc/shaderc_metal.cpp
    )
target_compile_definitions( brtshaderc PRIVATE "-D_CRT_SECURE_NO_WARNINGS" )
set_target_properties( brtshaderc PROPERTIES FOLDER "bgfx/tools" )
target_link_libraries( brtshaderc bx bimg bgfx-vertexlayout bgfx-shader-spirv fcpp glsl-optimizer glslang spirv-cross spirv-tools )
target_include_directories( brtshaderc PRIVATE
    ${BGFX_DIR}/3rdparty/webgpu/include
    ${BGFX_DIR}/3rdparty/spirv-cross
    ${BGFX_DIR}/3rdparty/spirv-cross/include
    )