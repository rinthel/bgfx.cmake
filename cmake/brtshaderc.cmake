
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
target_link_libraries( brtshaderc bx bimg bgfx-vertexdecl bgfx-shader-spirv fcpp glsl-optimizer glslang spirv-cross spirv-tools )
