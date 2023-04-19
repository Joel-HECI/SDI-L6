# SDI1-L6

SISTEMAS SECUENCIALES GUIA # 1
TODAS LAS PRUEBAS Y COMPROBACIONES SE REALIZAN PRIMERO EN TINKERCAD ó LOGIC.LY Y LUEGO EN VIVADO PARA LLEVARSE A LA FPGA (Basys 3). COMO NO SE REALIZA EN UNA SOLA SESION DE LABORATORIO: TERMINE EN TIEMPO DE TRABAJO EXTRA, O SEA, FUERA DE CLASE ANTES DE LA PRESENTACIÓN FINAL EN SESION DE LABORATORIO.

1. Compruebe el funcionamiento de los Flip-Flops básico SET-RESET  (NAND ó NOR). (Su utilidad es como circuito anti-rebote para generar señales de reloj de flanco único) Las entradas son dos (2) pulsadores disponibles en la tarjeta. Elija bien si es con NAND o NOR. Simule en Vivado e implemente en la Basys 3.

1.1 Genere un bloque divisor de frecuencia que a partir de la señal de 100 MHz de la Basys 3 genere una señal de salida de 0,5 Hz (T=2")

2. Busque los integrados serie 7400 adecuados para los Flip-Flops tipo J-K, D y T y compruebe el modo de operación de estos de acuerdo a sus tablas de funcionamiento y datasheets (tambien en los videos compartidos). Nota: Para esto, todos los relojes de los flip-flops deben ser generados con el circuito divisor  punto 1.1 y habilitado o inhabilitado con una AND y un Switch de la tarjeta, como se vio en el ejemplo de clase realizado en Logic.ly.

3. Realice y pruebe en LEDs un contador ascendente de 4 bits asíncrono (entrada de reloj del anti-rebote del punto 1.1) simultáneamente y con el mismo reloj, pero en otros 4 LEDs diseñe y pruebe un contador de 4 bits descendente asíncrono. (Note que cada salida está dividida en frecuencia con respecto a la señal de reloj utilizada). 

4. Diseñe un divisor de frecuencia síncrono que suministre una frecuencia de 16000Hz, 1000Hz, 250Hz y 125Hz a partir del reloj oscilador de 100MHz de la tarjeta Basys3.  Estas 4 frecuencias se deben mostrar en el osciloscopio saliendo de la tarjeta por los PMODs. Elija si salir de la tarjeta con un solo pin PMOD o por 4 pines PMOD.

5. Diseñe e implemente los registros (hechos con Flip Flops) de los tipos: - Serie – Paralelo, - Paralelo - Paralelo, - Paralelo – Serie . Cada uno de al menos 4 bits. Entradas con Dipswitchs o pulsadores acorde a la necesidad. Todos los pulsos de reloj se deben generar con el antirrebote del punto 1 ó 1.1. Los registros son síncronos.
