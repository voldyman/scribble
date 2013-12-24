project (scribble)

cmake_minimum_required (VERSION 2.6)

LIST (APPEND CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake)

set (DATADIR "${CMAKE_INSTALL_PREFIX}/share")
set (PKGDATADIR "${DATADIR}/${CMAKE_PROJECT_NAME}")
set (EXEC_NAME "${CMAKE_PROJECT_NAME}")
set (RELEASE_NAME "dingaling")
set (VERSION "0.1")
set (VERSION_INFO "minimal note-taking application")


configure_file (${CMAKE_SOURCE_DIR}/src/Config.vala.cmake ${CMAKE_SOURCE_DIR}/src/Config.vala)

find_package (PkgConfig)
pkg_check_modules (DEPS gtk+-3.0 granite)

add_definitions (${DEPS_CFLAGS})
link_libraries (${DEPS_LIBRARIES})
link_directories(${DEPS_LIBRARY_DIRS})

# Comment this out to enable C compiler warnings
add_definitions (-w)

find_package (Vala REQUIRED)
include (ValaVersion)

ensure_vala_version ("0.18" MINIMUM)

include (ValaPrecompile)

vala_precompile (VALA_C ${EXEC_NAME}
  src/Scribble.vala
  src/MainWindow.vala
  src/Config.vala
  src/Widgets/ContentView.vala
  src/Widgets/NotesList.vala
  src/Widgets/NoteView.vala
PACKAGES
  gtk+-3.0
  granite
)

add_executable(${EXEC_NAME} ${VALA_C})

install (TARGETS ${EXEC_NAME} RUNTIME DESTINATION bin)


install (FILES ${CMAKE_CURRENT_SOURCE_DIR}/data/notebook.png DESTINATION ${PKGDATADIR})

install (FILES ${CMAKE_CURRENT_SOURCE_DIR}/data/noteview.css DESTINATION ${PKGDATADIR})

install (FILES ${CMAKE_CURRENT_SOURCE_DIR}/data/${CMAKE_PROJECT_NAME}.desktop DESTINATION ${DATADIR}/applications/)

