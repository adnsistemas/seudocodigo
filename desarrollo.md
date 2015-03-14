# Compilación del proyecto #

Para poder compilar el proyecto es necesario instalar primero los componentes SynEdit. Luego abrir el grupo de proyectos 'seudocodigo' en el directorio 'Source' y seleccionar el paquete 'PascalScript\_Core\_D5' e instalarlo.
Si se utiliza otra versión de Delphi (u otro entorno), se debe verificar que se tengan incluidas todas la unidades necesarias (langdef fundamentalmente).
Si al intentar compilar da un error de que no puede crear los '.dcu', es por la configuración de directorios del proyecto, hay que cambiarla, o crear el directorio.

Ahora ya está listo el entorno para poder trabajar sobre el proyecto seudocódigo, tanto en la parte del editor, como en la del intérprete.
El intérprete corresponde al proyecto 'PascalScript...' y el entorno al proyecto 'seudocodigo.exe'.


---

# Compilation of the project #

You need to install SynEdit components first, in order to be able to compile the project.
Then open the project group 'seudocodigo' in the 'Source' folder and select the 'PascalScript\_Core\_D5' package and install it.
If you use a different Delphi version (or a different environment) you must verify that all required units are included in the proyect.
If you get an error about being unable to create '.dcu' when trying to compile, it's due to the project directories configuration. Change the project configuration or create the missing directories.

Now you have the environment ready for develpment of the interpreter and the editor. The editor project is 'seudocodigo.exe' and the interpreter project is 'PascalScript...'.