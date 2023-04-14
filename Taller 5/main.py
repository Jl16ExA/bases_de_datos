import itertools

# Dependencias funcionales iniciales
dependencias_funcionales = [
    (
        set(["id_producto"]),
        set(["nombre_producto", "descripción", "precio_venta", "id_proveedor"]),
    ),
    (
        set(["id_proveedor"]),
        set(["nombre_proveedor", "dirección", "teléfono", "correo_electrónico"]),
    ),
    (
        set(["id_compra"]),
        set(
            [
                "fecha_compra",
                "id_cliente",
                "id_producto",
                "cantidad_comprada",
                "precio_total",
            ]
        ),
    ),
    (
        set(["id_cliente"]),
        set(["nombre_cliente", "dirección", "teléfono", "correo_electrónico"]),
    ),
    (set(["nombre_producto"]), set(["descripción"])),
]


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


# Función para verificar la propiedad de la unión
def verificar_propiedad_union(dependencias_funcionales):
    # Compara cada par de dependencias funcionales
    for df1 in dependencias_funcionales:
        for df2 in dependencias_funcionales:
            # Si los determinantes son iguales y las dependencias son distintas
            if df1 != df2 and df1[0] == df2[0]:
                # Verifica si el cierre de la unión de los determinados es igual al cierre del determinante
                if not calcular_cierre(
                    df1[0], dependencias_funcionales
                ) == calcular_cierre(df1[0].union(df2[0]), dependencias_funcionales):
                    return False
    return True


# Función para verificar la propiedad de transitividad
def verificar_propiedad_transitividad(dependencias_funcionales):
    # Compara cada par de dependencias funcionales
    for df1 in dependencias_funcionales:
        for df2 in dependencias_funcionales:
            # Si los determinados son iguales y las dependencias son distintas
            if df1 != df2 and df1[1] == df2[0]:
                # Verifica si el cierre del determinante incluye el determinado de la segunda dependencia
                if not calcular_cierre(df1[0], dependencias_funcionales).issuperset(
                    df2[1]
                ):
                    return False
    return True


# Ejecución de las funciones para cada paso
print("Cierre de dependencias funcionales")
for atributos, dependencia in dependencias_funcionales:
    print(
        f"Cierre({atributos}) = {calcular_cierre(atributos, dependencias_funcionales)}"
    )
print("\nVerificar propiedad de la unión")
print(verificar_propiedad_union(dependencias_funcionales))
print("\nVerificar propiedad de transitividad")
print(verificar_propiedad_transitividad(dependencias_funcionales))
