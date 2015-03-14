## TIPOS DE DATOS ##
**archivo**

**cadena**

**caracter**

**entero** _//–2147483648..2147483647_

**entero\_corto** _// -32768..32767_

**entero\_largo** _// –2<sup>63..2</sup>63–1_

**entero\_minimo**  _// -128..127_

**fechayhora**  _// es un real, la parte entera son la cantidad de días desde 30/12/1899, y la parte fraccionaria son las horas como fracción de 24hs_

**logico** _//puede ser Verdadero o Falso_

**moneda** _// –922337203685477.5808..922337203685477.5807_

**ordinal** _// entero sin signo 0..4294967295_

**ordinal\_corto** _//entero\_corto sin signo 0..65535_

**real** _//5.0 x 10<sup>–324 .. 1.7 x 10</sup>308_

**real\_corto** _// 1.5 x 10<sup>–45 .. 3.4 x 10</sup>38_

**real\_largo** _// 3.6 x 10<sup>–4951 .. 1.1 x 10</sup>4932_

**lista** _//cada posición puede contener cualquiera de los siguientes tipos: entero, real,  logico, cadena, caracter o lista_


## CONSTANTES ##
**Falso**

**Verdadero**


## PALABRAS Y SÍMBOLOS RESERVADOS ##
**<-** _//asignación_

**\** _// división entera_

**/** _//división_

**`*`** _// multiplicación_

**^** _// exponenciación_

**+** _// suma y concatenación de cadenas_

**-** _// resta_

**""** _// constantes de cadena_

**''** _// constante de caracter_

**$** _// $nn representación de constantes numéricas en formato hexadecimal_

**arreglo**

**caso**

**conjunto** _// declara una variable como un conjunto de valores de algún tipo entero o numerado_

**de**

**desde**

**dividido** _//división entera, equivalente a \_

**en** _// prueba si un elemento está en un conjunto_

**entonces**

**estructura**

**fin**

**fin\_estructura**

**fin\_funcion**

**fin\_iterar**

**fin\_mientras**

**fin\_procedimiento**

**fin\_programa**

**fin\_segun**

**fin\_si**

**fin\_variar**

**funcion**

**hacer**

**hasta** _// parte del variar_

**hasta\_que**

**implementacion** _//se utilza en los archivos de subprogramas para codificar los subprogramas_

**inicio**

**inmutable** _//declara una constante_

**interfaz** _//se utiliza en los archivos de subprogramas para declarar los subprogramas que pueden utilizarse desde otros archivos_

**iterar**

**mientras**

**modulo** _//calcula el módulo de la división_

**no** _//negación lógica_

**O** _//unión lógica_

**oex** _// o exclusivo: A oex B = (A O B) Y NO(A Y B)_

**paso**

**porRef** _//pasaje por referencia_

**procedimiento**

**programa**

**repetir**

**resultado** _//variable ficticia utilizada en las funciones para contener el valor de retorno de la misma_

**Salir\_Si**

**segun**

**si**

**sino**

**subprogramas**

**utiliza** _//incluye el código de otro archivo en éste_

**variar**

**Y** _//disjunción lógica_


## PROCEDIMIENTOS ##
**procedimiento** Borrar(**cadena porRef** s;**entero** posición,cantidad) _//elimina cantidad caracteres de s, a partir de posición_

**procedimiento** CerrarArchivo(**archivo porRef** arch) _//cierra el archivo, rompiendo el enlace con la variable `<arch>`_

**procedimiento** Decrementar(**entero porRef** x) _//modifica x restándole 1_

**procedimiento** DecodificarFecha(**fechayhora** x;**ordinal\_corto porRef** año,mes,día) _//separa la fecha x en año, mes y día_

**procedimiento** Elemento(**lista** l;**porRef** x;**entero** posicion) _//coloca en x una copia del elemento de la posición indicada de l (si existe)_

**procedimiento**DecodificarHora(**fechayhora**x;**ordinal\_corto porRef**hora,minutos,segundos,milisegundos) _//separa la hora x en hora, minutos, segundos y milisegundos_

**procedimiento**EstablecerLongitud(**cadena porRef**x;**entero**nuevalongitud) _//establece la longitud de x en nuevalongitud, el contenido previo no se pierde (excepto si se achica la longitud), el contenido del nuevo 'espacio' no está definido (es cualquier cosa)_

**procedimiento**Incrementar(**entero porRef**x) _//aumenta x en 1_

**procedimiento**Leer(**porRef**x) _//lee por teclado y lo almacena en x_

**procedimiento**LeerFechaYHora(**entero porRef**x) _//lee del teclado una fecha y hora_

**procedimiento**Mostrar(x) _//muestra por 'pantalla' el contenido de x_

**procedimiento**MostrarYLeer(**cadena**mostrar;**porRef**x) _//muestra 'mostrar' y lee por teclado y lo almacena en x_

**procedimiento**Quitar(**lista porRef**l;**entero**posicion) _//elimina el elemento de la posición indicada de l (si existe)_

**procedimiento**Primero(**lista**l;**porRef**x) _//devuelve el primer elemento de la lista, equivalente a Elemento(l,x,1)_

**procedimiento**Reemplazar(**lista porRef**l;x;**entero**posicion) _//reemplaza el elemento de l, de la posición indicada, por el contenido de x_

**procedimiento**Ultimo(**lista**l;**porRef**x) _//devuelve el último elemento de la lista, equivalente a Elemento(l,x,Longitud(l))_

**procedimiento**VaciarArchivo(**archivo porRef**arch) _//elimina todo el contenido del archivo, dejando el mismo como si acabara de crearse_


## FUNCIONES ##
**funcion**AbrirArchivo(**cadena**nombre)**archivo resultado**_//abre un archivo existente, de nombre `<nombre>`, devuelve el enlace al archivo_

**funcion**ACadena(x)**cadena resultado**_//convierte x a su representación de texto_

**funcion**Agregar(**lista porRef**l;x)**entero resultado**_//agrega x a la lista y devuelve el índice del elemento agregado_

**funcion**Ahora **fechayhora resultado**_//devuelve la fecha y hora actuales_

**funcion**Aleatorio(**entero**max) **real resultado**_//devuelve un número aleatorio comprendido entre 0 y max, o entre 0 y 1 si max es 0_

**funcion**DiaDeLaSemana(**fechayhora**x) **cadena resultado**_//devuelve el nombre del día de la semana que corresponde a la fecha x_

**funcion**CadenaAEntero(**cadena**x)**entero resultado**_//convierte la cadena (que debe representar un número) en un entero_

**funcion**CadenaAEnteroLargo(**cadena**x)**entero\_largo resultado**_//convierte la cadena (que debe representar un número) en un entero largo_

**funcion**CadenaAFecha(**cadena**x)**fechayhora resultado**_//convierte la cadena (que representa una fecha) en una fecha y hora_

**funcion**CadenaAReal(**cadena**x)**real resultado**_//convierte la cadena (que debe representar un número) en un real_

**funcion**Cantidad(**lista**l)**entero resultado**_//devuelve la cantidad de elementos contenidos en l_

**funcion**CaracterACodigo(**caracter**c)**entero resultado**_//devuelve el número ASCII correspondiente al caracter_

**funcion**CodificarFecha(**ordinal\_corto**año, mes, día) **fechayhora resultado**_//convierte el año, mes y día en una fecha_

**funcion**CodificarHora(**ordinal\_corto**hora, minutos, segundos, milisegundos) **fechayhora resultado**_//convierte la hora, minutos, segundos y milisegundos en una hora_

**funcion**CodigoACaracter(**entero**c)**caracter resultado**_//devuelve el caracter correspondiente al número ingresado (según la tabla ASCII)_

**funcion**CrearArchivo(**cadena**nombre)**archivo resultado**_//crea el archivo de nombre `<nombre>`, devuelve el enlace al archivo_

**funcion**EscribirArchivo(**archivo porRef**arch;x)**entero resultado**_//escribe el contenido de `<x>` en el archivo, en el registro actual, devuelve la nueva posición_

**funcion**Fecha **fechayhora resultado**_//devuelve la fecha actual_

**funcion**FechaACadena(**fechayhora**x) **cadena resultado**_//convierte la fecha y hora en la cadena equivalente_

**funcion**FormatoFechaYHora(**cadena**formato; **fechayhora**x) **cadena resultado**_//convierte la fecha y hora x en una cadena, según el formato especificado (ver al final)_

**funcion**Hora **fechayhora resultado**_//devuelve la hora actual_

**funcion**IntentarCodificarFecha(**entero**año, mes, día; **fechayhora**sifalla)**fechayhora resultado**_//intenta codificar la fecha y si no se puede devuelve 'sifalla'_

**funcion**IntentarCodificarHora(**entero**horas, minutos, segundos, milisegundos; **fechayhora**sifalla)**fechayhora resultado**_//intenta codificar la hora, si no puede devuelve 'sifalla'_

**funcion**LeerArchivo(**archivo porRef**arch;**porRef**x)**entero resultado**_//lee el registro actual del archivo, colocando su contenido en `<x>`, devuelve la nueva posición_

**funcion**Longitud(**cadena**x)**entero resultado**_//devuelve la longitud de x, medido en caracteres_

**funcion**Mayor(x) **entero resultado**_// devuelve el mayor valor que puede tomar X, si es un arreglo, o cadena, el mayor subíndice válido_

**funcion**Mayusculas(**cadena**x) **cadena resultado**_//convierte x a mayúsculas_

**funcion**Menor(X)**entero resultado**_//devuelve el valor menor que puede tomar x, si es un arreglo, o cadena, devuelve el menor subíndice válido_

**funcion**MenosPrimero(**lista porRef**l)**lista resultado**_//quita el primer elemento de la lista y la devuelve_

**funcion**MenosUltimo(**lista porRef**l)**lista resultado**_//quita el último elemento de la lista y la devuelve_

**funcion**Minusculas(**cadena**x) **cadena resultado**_//convierte x a minúsculas_

**funcion**MismoTexto(**cadena**a,b)**logico resultado**_//devuelve verdadero si las dos cadenas son iguales, sin diferenciar entre Mayúsculas y Minúsculas_

**funcion**MismoTipo(**lista**l;x;**entero**posición)**logico resultado**_//devuelve Verdadero si el tipo del elemento de la posición indicada de l es idéntico al tipo de x_

**funcion**ParteEntera(**real**x) **real resultado**_//devuelve x con la parte decimal en 0_

**funcion**PantallaDeMensaje(**cadena**texto,título;**entero\_largo**estilo)**entero resultado**_//muestra un mensaje al usuario según el estilo indicado (ver al final) y devuelve un valor indicando lo que hizo el usuario (ver al final)_

**funcion**Pi **real resultado**_//devuelve la mejor aproximación posible al valor de pi_

**funcion**Posicion(**cadena**abuscar,buscaren) **entero resultado**_//si 'abuscar' es parte de 'buscaren', devuelve la posición del primer caracter de 'abuscar' dentro de 'buscaren', si no se encuentra devuelve 0. La búsqueda diferencia minúsculas de mayúsculas.;_

**funcion**PosicionArchivo(**archivo porRef**arch)**entero resultado**_// devuelve la posición actual del archivo_

**funcion**PosicionarArchivo(**archivo porRef**arch;**entero**posicion)**entero resultado**_//ubica el archivo en el registro `<posicion>`, si éste existe, devuelve la nueva posición del archivo_

**funcion**Raiz2(**real**x) **real resultado**_//devuelve la raiz cuadrada de x_

**funcion**Recortar(**cadena**x) **cadena resultado**_//quita los espacios al comienzo y final de x (no modifica x)_

**funcion**Seno(**real**x) **real resultado**_// devuelve el seno del ángulo x (en radianes)_

**funcion**Subcadena(**cadena**s;**entero**posición,cantidad)**cadena resultado**_//devuelve una cadena formada por cantidad caracteres (o menos), que corresponden a los caracteres de s, a partir de posición_

**funcion**TamañoArchivo(**archivo porRef**arch)**entero resultado**_//devuelve la cantidad de registros almacenados en el archivo_

**funcion**TamañoDe(X)**entero resultado**_//devuelve el tamaño ocupado por la variable X_

**funcion**Truncar(**real**x)**entero resultado**_// devuelve la parte entera de x_

**funcion**ValidoArchivo(**archivo porRef**arch)**logico resultado**_// determina si una variable de tipo archivo está enlazada a un archivo real, de forma que pueda ser utilizada_

**funcion**ValorAbsoluto(**real**x) **ordinal resultado**_//devuelve el valor absoluto de x_