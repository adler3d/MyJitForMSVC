@if exist "C:\Program Files (x86)\Microsoft Visual Studio 10.0\Common7\Tools\vsvars32.bat" (
    @call "C:\Program Files (x86)\Microsoft Visual Studio 10.0\Common7\Tools\vsvars32.bat"
    @echo MSVC2010
    @goto ok
) else (
  @if exist "C:\Program Files (x86)\Microsoft Visual Studio 11.0\Common7\Tools\vsvars32.bat" (
      @call "C:\Program Files (x86)\Microsoft Visual Studio 11.0\Common7\Tools\vsvars32.bat"
      @echo MSVC2011
      @goto ok
  ) else (
    @if exist "C:\Program Files (x86)\Microsoft Visual Studio 12.0\Common7\Tools\vsvars32.bat" (
        @call "C:\Program Files (x86)\Microsoft Visual Studio 12.0\Common7\Tools\vsvars32.bat"
        @echo MSVC2012
        @goto ok
    ) else (
      @if exist "C:\Program Files (x86)\Microsoft Visual Studio 13.0\Common7\Tools\vsvars32.bat" (
          @call "C:\Program Files (x86)\Microsoft Visual Studio 13.0\Common7\Tools\vsvars32.bat"
          @echo MSVC2013
          @goto ok
      ) else (
          @echo "MSVC2013 not found "
          @goto fail
      )
    )
  )
)

@call "C:\Program Files (x86)\Microsoft Visual Studio 12.0\Common7\Tools\vsvars32.bat"
:ok
@cl /nologo /EHsc jit_main.cpp
:fail
:end
exit /b 2
