@ECHO OFF
SETLOCAL ENABLEEXTENSIONS

SET VERSION=1.0
SET COMMAND_OR_PROJECT_NAME=%1
SET PROJECT_NAME=%2
SET KIT_URL=https://github.com/DevTips/DevTips-Starter-Kit.git
SET KIT_GULP_URL=https://github.com/mriverodorta/DevTips-Starter-Kit.git
SET KIT_NAME_SASS=DevTips-Starter-Kit
SET KIT_NAME_JEKYLL=Jekyll-Starter-Kit
SET KIT_NAME_GULP=Gulp-Starter-Kit


IF "%COMMAND_OR_PROJECT_NAME%"=="" (
  CALL:head
  echo Creating project on %KIT_NAME_SASS% folder
  git clone %KIT_URL%
  cd %KIT_NAME_SASS%
  rmdir /Q /S .git
  CALL:hit
  echo Project ready
  GOTO:EOF
  )

IF "%COMMAND_OR_PROJECT_NAME%"=="-sass" GOTO:SASS
IF "%COMMAND_OR_PROJECT_NAME%"=="-v" GOTO:VERSION
IF "%COMMAND_OR_PROJECT_NAME%"=="-version" GOTO:VERSION
IF "%COMMAND_OR_PROJECT_NAME%"=="-h" GOTO:HELP
IF "%COMMAND_OR_PROJECT_NAME%"=="-help" GOTO:HELP
IF "%COMMAND_OR_PROJECT_NAME%"=="-jekyll" GOTO:JEKYLL
IF "%COMMAND_OR_PROJECT_NAME%"=="-gulp" GOTO:GULP

IF "%PROJECT_NAME%"=="" IF NOT "%COMMAND_OR_PROJECT_NAME%"=="" (
  echo Creating project on %COMMAND_OR_PROJECT_NAME% folder
  git clone %KIT_URL% %COMMAND_OR_PROJECT_NAME%
  cd %COMMAND_OR_PROJECT_NAME%
  rmdir /Q /S .git
  CALL:hit
  echo Project ready
  GOTO:EOF
  )


ECHO Command %COMMAND_OR_PROJECT_NAME% not recognized

:VERSION
  ECHO devtips cli version %VERSION%
GOTO:EOF

:HELP
  echo The Devtips CLI is a simple tool for create new
  echo projects based on the DevTips-Starter-Kit
  echo -----------------------------------------------
  echo Usage:
  echo.  devtips [option^|project-name] project-name
  echo Options
  echo. -sass         Create a project with the default Devtips-Starter-Kit
  echo. -jekyll       Create a project with the jekyll version of the Devtips-Starter-Kit
  echo. -gulp         Create a Gulp based project with the Devtips-Starter-Kit
  echo. -h^|-help     Show this help message
  echo. -v^|-version  Show the version of the Devtips CLI
  echo Example
  echo. devtips -gulp new-project
  echo.     Will create a new folder named "new-project"
  echo.     with the gulp structure of Devtips-Starter-Kit
GOTO:EOF

:SASS
  CALL:head
  echo Creating project on %PROJECT_NAME% folder
  git clone %KIT_URL% %PROJECT_NAME%
  cd %PROJECT_NAME%
  rmdir /Q /S .git
  CALL:hit
  echo Project ready
GOTO:EOF

:JEKYLL
  CALL:head
  echo Creating project on %PROJECT_NAME% folder
  git clone -b %KIT_NAME_JEKYLL% --single-branch %KIT_URL% %PROJECT_NAME%
  cd %PROJECT_NAME%
  rmdir /Q /S .git
  CALL:hit
  echo Project ready
GOTO:EOF

:GULP
  CALL:head
  echo Creating project on%PROJECT_NAME% folder
  git clone -b %KIT_NAME_GULP% --single-branch %KIT_GULP_URL% %PROJECT_NAME%
  cd %PROJECT_NAME%
  rmdir /Q /S .git
  CALL:hit
  gulp install
  bower install
  echo Project ready
GOTO:EOF

REM Count how many times this script has been used
:hit
curl -i --silent -m 1 -X GET http://maikelrivero.com:2020/hit
GOTO:EOF

:head
echo DevTips Starter Kit CLI
echo -----------------------
GOTO:EOF
