include_directories (/usr/local/include/GNUstep /usr/include/GNUstep)
link_directories(/usr/lib /usr/local/lib)

macro (set_gnustep_compile_options dir)
  set(GNUSTEP_DEFINITIONS "GNUSTEP;GNUSTEP_BASE_LIBRARY=1;GNU_GUI_LIBRARY=1;GNU_RUNTIME=1;GNUSTEP_BASE_LIBRARY=1;_NATIVE_OBJC_EXCEPTIONS;GSWARN;GSDIAGNOSE;_FORTIFY_SOURCE=2")
  set(GNUSTEP_COMPILE_OPTIONS "-fno-strict-aliasing -fexceptions -fobjc-exceptions -fPIC -Wall -Wno-import -fstack-protector --param=ssp-buffer-size=4 -Wformat -Wformat-security -Werror=format-security -fgnu-runtime -fconstant-string-class=NSConstantString")
  foreach (d ${dir} ${ARGN})
    file (GLOB objc_srcs "${d}/*.m")
    file(GLOB objcxx_srcs "${d}/*.mm")
    set_source_files_properties (${objc_srcs} PROPERTIES
      LANGUAGE C
      COMPILE_DEFINITIONS "${GNUSTEP_DEFINITIONS}"
      COMPILE_FLAGS ${GNUSTEP_COMPILE_OPTIONS})
    set_source_files_properties (${objcxx_srcs} PROPERTIES
      LANGUAGE CXX
      COMPILE_DEFINITIONS "${GNUSTEP_DEFINITIONS}"
      COMPILE_FLAGS ${GNUSTEP_COMPILE_OPTIONS})
  endforeach ()
endmacro ()

macro (set_gnustep_link_options target)
  set(GNUSTEP_LINK_OPTIONS "-rdynamic -Wl,-Bsymbolic-functions -Wl,-z,relro -shared-libgcc")
  # Now I only add gnustep-base, just add more for other gnustep libraries.
  set(GNUSTEP_LIBS gnustep-base pthread objc m)
  foreach (t ${target} ${ARGN})
    set_target_properties (${t} PROPERTIES
      LINK_FLAGS ${GNUSTEP_LINK_OPTIONS})
    target_link_libraries(${t} ${GNUSTEP_LIBS})  
  endforeach ()
endmacro ()
