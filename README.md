<a name="top"></a>

<h1 align="center">
  <strong><span>⚔️ Kimetsu no Yaiba App ⚔️</span></strong>
</h1>

---

<p align="center">
  <strong><span style="font-size:20px;">Proyecto personal</span></strong>
</p>

---

<p align="center">
  <strong>Autor:</strong> Salva Moreno Sánchez
</p>

<p align="center">
  <a href="https://www.linkedin.com/in/salvador-moreno-sanchez/">
    <img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white" alt="LinkedIn">
  </a>
</p>

## Índice
 
* [Herramientas](#herramientas)
* [Proyecto: ⚔️ Kimetsu no Yaiba App ⚔️](#proyecto)
	* [Descripción](#descripcion)
	* [Instalación](#instalacion)
	* [Licencia](#licencia)

<a name="herramientas"></a>
## Herramientas

<p align="center">

<a href="https://www.apple.com/es/ios/ios-17/">
   <img src="https://img.shields.io/badge/iOS-000000?style=for-the-badge&logo=ios&logoColor=white" alt="iOS">
 </a>
  
 <a href="https://www.swift.org/documentation/">
   <img src="https://img.shields.io/badge/swift-F54A2A?style=for-the-badge&logo=swift&logoColor=white" alt="Swift">
 </a>
  
 <a href="https://developer.apple.com/xcode/">
   <img src="https://img.shields.io/badge/Xcode-007ACC?style=for-the-badge&logo=Xcode&logoColor=white" alt="XCode">
 </a>
  
</p>

* **iOS:** 16
* **Swift:** 5.9
* **Xcode:** 14.3.1

<a name="proyecto"></a>
## Proyecto: ⚔️ Kimetsu no Yaiba App ⚔️

![Demo app iOS gif](images/demoAppIOS.gif)

<a name="descripcion"></a>
### Descripción

Esta app proporciona una plataforma para acceder a noticias y detalles sobre la serie de anime Kimetsu no Yaiba. Las principales características de la app incluyen:

* **Autenticación de usuarios:** gestión de registro e inicio de sesión de usuarios, con datos almacenados en una base de datos PostgreSQL.
* **Pantalla de noticias:** presenta las últimas noticias relacionadas con Kimetsu no Yaiba, obtenidas mediante la API desarrollada en Vapor.
* **Pantalla de episodios:** muestra una lista de episodios de la serie. Cada episodio cuenta con un detalle que proporciona información adicional, incluyendo la sinopsis y los personajes que aparecen en él.

La [API desarrollada en Vapor](https://github.com/salvaMsanchez/Vapor-KimetsuAPI) maneja todas las solicitudes y respuestas, garantizando una comunicación fluida y segura. PostgreSQL se utiliza para el almacenamiento de datos de usuarios y contenido de la serie, asegurando la persistencia y accesibilidad de la información. Esta app sirve como una demostración práctica de las capacidades de la API y la gestión de usuarios.

<a name="instalacion"></a>
### Instalación

1. Clona el repositorio.
2. Abre el proyecto en XCode.
3. Introduce la api *key* en `Constants` > `General`. Para esta aplicación se emplea el servidor montado en Vapor que podemos encontrar [aquí](https://github.com/salvaMsanchez/Vapor-KimetsuAPI), cuya configuración y funcionalidad están explicadas detalladamente.
4. Conecta un dispositivo iOS o utiliza el simulador.
5. Ejecuta la aplicación.

<a name="licencia"></a>
### Licencia

Este proyecto está bajo la Licencia MIT - ver el archivo [LICENSE.md](https://github.com/salvaMsanchez/KimetsuApp/blob/main/LICENSE.md) para más detalles.

---

[Subir ⬆️](#top)

---


