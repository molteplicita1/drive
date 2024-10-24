/**
 * 
 */

function buildBody() {
	var book1 = {
		isbn: "1234",
		title: "Distributed Systems: Concepts and Design",
		author: "George Colouris",
		description: "Broad and up-to-date coverage of the principles and practice in the fast moving area of Distributed Systems.<br><br>Distributed Systems provides students of computer science and engineering with the skills they will need to design and maintain software for distributed applications. It will also be invaluable to software engineers and systems designers wishing to understand new and future developments in the field.<br><br>From mobile phones to the Internet, our lives depend increasingly on distributed systems linking computers and other devices together in a seamless and transparent way. The fifth edition of this best-selling text continues to provide a comprehensive source of material on the principles and practice of distributed computer systems and the exciting new developments based on them, using a wealth of modern case studies to illustrate their design and development. The depth of coverage will enable readers to evaluate existing distributed systems and design new ones.",
		url: "https://www.amazon.com/Distributed-Systems-Concepts-Design-5th/dp/0132143011",
	}
	var book2 = {
		isbn: "4321",
		title: "Large-Scale Software Architecture: A Practical Guide using UML",
		author: "Jeff Garland, Richard Anthony",
		description: "The purpose of large-scale software architecture is to capture and describe practical representations to make development teams more effective.<br><br>In this book the authors show how to utilise software architecture as a tool to guide the development instead of capturing the architectural details after all the design decisions have been made.<br><br>* Offers a concise description of UML usage for large-scale architecture<br>* Discusses software architecture and design principles<br>* Technology and vendor independent",
		url: "https://www.amazon.com/Large-Scale-Software-Architecture-Practical-Guide/dp/0470848499",
	}
	var book3 = {
		isbn: "3333",
		title: "Middleware for Distributed Systems",
		author: "Richard E. Schantz, Douglas C. Schmidt",
		description: "Improvements in hardware and networking technologies over the past decades have yielded dramatic increases in computer and communication capabilities. Despite these advances, the effort and cost required to develop, validate, port, and enhance software for distributed systems remained remarkably high. Much of the complexity and cost of building these systems can be alleviated by the use of highly flexible, efficient, dependable, and secure middleware, which is infrastructure software that resides between the applications and the underlying operating systems, networks, and hardware, specifically intended to provide a more appropriate platform for building and operating distributed systems. Middleware's primary roles are to (1) functionally bridge the gap between application programs and the lower-level hardware and software infrastructure to coordinate how parts of applications are connected and how they interoperate and (2) provide reusable services that can be composed, configured, and deployed to create distributed systems rapidly and robustly by integrating components that may be developed by multiple technology suppliers.",
		url: "https://www.dre.vanderbilt.edu/~schmidt/PDF/middleware-chapter.pdf",
	}
	
	buildList(book1, book2, book3);
}

function buildList() {
	const body = document.getElementsByTagName("body")[0];
	const ol = document.createElement("ol");
	
	ol.style.setProperty("--length", "3")
	
	body.appendChild(ol);
	for(var i = 0; i < arguments.length; i++)
		ol.appendChild(buildListItem(arguments[i], i+1));
	
}

function buildListItem(book, number) {
	const li = document.createElement("li");
	li.style.setProperty("--i", String(number));
	
	var currentElement = document.createElement("a");
	currentElement.setAttribute("href", book.url);
	currentElement.innerText = book.title;
	li.appendChild(currentElement);
	
	currentElement = document.createElement("h5");
	currentElement.setAttribute("class", "isbn-class");
	currentElement.innerText = book.isbn;
	li.appendChild(currentElement);
	
	currentElement = document.createElement("h5");
	currentElement.setAttribute("class", "author-class");
	currentElement.innerText = book.author;
	li.appendChild(currentElement);
	
	currentElement = document.createElement("p");
	currentElement.innerHTML = book.description;
	li.appendChild(currentElement);
	
	currentElement = document.createElement("input");
	currentElement.setAttribute("type", "button");
	currentElement.setAttribute("value", "Order");
	li.appendChild(currentElement);
	
	return li;
}
