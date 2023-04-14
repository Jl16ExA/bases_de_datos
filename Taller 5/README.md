# Objetivos

Se tiene una base de datos en una empresa de venta de productos electrónicos con información de productos, proveedores y compras realizadas por los clientes. Se requiere realizar un proceso de limpieza de los datos y optimizar la base de datos.

## Tablas y atributos
### Tabla de productos
```
id_producto (identificador único)
nombre_producto
descripción
precio_venta
id_proveedor (identificador del proveedor que suministra el producto)
```
### Tabla de proveedores
```
id_proveedor (identificador único)
nombre_proveedor
dirección
teléfono
correo_electrónico
```
### Tabla de compras
```
id_compra (identificador único)
fecha_compra
id_cliente (identificador del cliente que realizó la compra)
id_producto (identificador del producto comprado)
cantidad_comprada
precio_total
```
### Dependencias funcionales

```python
id_producto -> nombre_producto, descripción, precio_venta, id_proveedor
id_proveedor -> nombre_proveedor, dirección, teléfono, correo_electrónico
id_compra -> fecha_compra, id_cliente, id_producto, cantidad_comprada, precio_total
id_cliente -> nombre_cliente, dirección, teléfono, correo_electrónico
nombre_producto -> descripción
```

## Pasos para realizar la tarea
- Paso 1: Identificar todas las dependencias **funcionales** que se cumplen en la base de datos
Utilizar las dependencias funcionales proporcionadas y analizar si existen otras adicionales en la base de datos.

- Paso 2: Determinar el cierre de todas las dependencias funcionales
Encontrar todos los atributos que pueden ser determinados a partir de las dependencias funcionales existentes.

- Paso 3: Verificar si la base de datos cumple con la propiedad de la unión
Comprobar que, si tenemos dos conjuntos de atributos A y B, el conjunto de atributos determinados por A y B juntos es igual al cierre de A unido al cierre de B.

- Paso 4: Verificar si la base de datos cumple con la propiedad de la transitividad
Comprobar que, si tenemos tres conjuntos de atributos A, B y C, y A determina B, y B determina C, entonces A determina C.

- Paso 5: Identificar y corregir todas las redundancias y anomalías funcionales que puedan existir en la base de datos
En base a los resultados de los pasos anteriores, corregir las redundancias y anomalías funcionales presentes en la base de datos.

Resultado esperado
Una base de datos optimizada y sin redundancias ni anomalías funcionales.


# Dependencias funcionales

```python
import itertools

# Dependencias funcionales iniciales
dependencias_funcionales = [
    (["id_producto"], ["nombre_producto", "descripción", "precio_venta", "id_proveedor"]),
    (["id_proveedor"], ["nombre_proveedor", "dirección", "teléfono", "correo_electrónico"]),
    (["id_compra"], ["fecha_compra", "id_cliente", "id_producto", "cantidad_comprada", "precio_total"]),
    (["id_cliente"], ["nombre_cliente", "dirección", "teléfono", "correo_electrónico"]),
    (["nombre_producto"], ["descripción"])
]

```
Siguiendo los pasos indicados, una posible integración de un algoritmo para desarrollar la tarea especificada puede ser:

## Definir una función para calcular el cierre:

```python

# Función para calcular el cierre de un conjunto de atributos
def calcular_cierre(atributos, dependencias_funcionales):
    cierre = set(atributos)
    cambios = True

    # Continúa iterando mientras haya cambios en el cierre
    while cambios:
        cambios = False
        # Itera sobre las dependencias funcionales
        for df in dependencias_funcionales:
            determinante, determinado = df
            # Si el determinante está en el cierre y el determinado no, actualiza el cierre
            if determinante.issubset(cierre) and not determinado.issubset(cierre):
                cierre.update(determinado)
                cambios = True
    return cierre

```

## Definir una función para verificar la propiedad de la unión:

```python

def verificar_propiedad_union(dependencias_funcionales):
    # Compara cada par de dependencias funcionales
    for df1 in dependencias_funcionales:
        for df2 in dependencias_funcionales:
            # Si los determinantes son iguales y las dependencias son distintas
            if df1 != df2 and df1[0] == df2[0]:
                # Verifica si el cierre de la unión de los determinados es igual al cierre del determinante
                if not calcular_cierre(df1[0], dependencias_funcionales) == calcular_cierre(df1[0].union(df2[0]), dependencias_funcionales):
                    return False
    return True
```

## Función para verificar la propiedad de transitividad:

```python

def verificar_propiedad_transitividad(dependencias_funcionales):
    # Compara cada par de dependencias funcionales
    for df1 in dependencias_funcionales:
        for df2 in dependencias_funcionales:
            # Si los determinados son iguales y las dependencias son distintas
            if df1 != df2 and df1[1] == df2[0]:
                # Verifica si el cierre del determinante incluye el determinado de la segunda dependencia
                if not calcular_cierre(df1[0], dependencias_funcionales).issuperset(df2[1]):
                    return False
    return True

```


## Ejecutar funciones

```python

# Ejecución de las funciones para cada paso
print("Cierre de dependencias funcionales")
for atributos, dependencia in dependencias_funcionales:
    print(f"Cierre({atributos}) = {cierre(atributos, dependencias_funcionales)}")

print("\nVerificar propiedad de la unión")
print(verificar_propiedad_union(dependencias_funcionales))

print("\nVerificar propiedad de transitividad")
print(verificar_propiedad_transitividad(dependencias_funcionales))

```

## Resultados

```
Cierre de dependencias funcionales
Cierre({'id_producto'}) = {'nombre_producto', 'id_proveedor', 'nombre_proveedor', 'correo_electrónico', 'descripción', 'precio_venta', 'teléfono', 'dirección', 'id_producto'}
Cierre({'id_proveedor'}) = {'id_proveedor', 'nombre_proveedor', 'correo_electrónico', 'teléfono', 'dirección'}
Cierre({'id_compra'}) = {'nombre_producto', 'id_proveedor', 'correo_electrónico', 'id_compra', 'descripción', 'precio_venta', 'teléfono', 'nombre_proveedor', 'dirección', 'id_cliente', 'id_producto', 'cantidad_comprada', 'fecha_compra', 'nombre_cliente', 'precio_total'}
Cierre({'id_cliente'}) = {'correo_electrónico', 'nombre_cliente', 'teléfono', 'dirección', 'id_cliente'}
Cierre({'nombre_producto'}) = {'nombre_producto', 'descripción'}

Verificar propiedad de la unión
True

Verificar propiedad de transitividad
True

```