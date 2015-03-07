#Pandoc Examples#  
##Code-Blocks##
###Graphviz - DOT###  

~~~ {.dot name="diagram1"}
digraph G {
       fontname = "Bitstream Vera Sans"
       fontsize = 8

       node [
               fontname = "Bitstream Vera Sans"
               fontsize = 8
               shape = "record"
       ]

       edge [
               fontname = "Bitstream Vera Sans"
               fontsize = 8
       ]

       Animal [
               label = "{Animal|+ name : string\l+ age : int\l|+ die() : void\l}"
       ]

       subgraph clusterAnimalImpl {
               label = "Package animal.impl"

               Dog [
                       label = "{Dog||+ bark() : void\l}"
               ]

               Cat [
                       label = "{Cat||+ meow() : void\l}"
               ]
       }

       edge [
               arrowhead = "empty"
       ]

       Dog -> Animal
       Cat -> Animal

       edge [
               arrowhead = "none"

               headlabel = "0..*"
               taillabel = "0..*"
       ]

       Dog -> Cat
}
~~~

###Graphviz - NEATO###  

~~~ {.neato name="diagram2"}
graph ER {
	node [shape=box]; course; institute; student;
	node [shape=ellipse]; {node [label="name"] name0; name1; name2;}
		code; grade; number;
	node [shape=diamond,style=filled,color=lightgrey]; "C-I"; "S-C"; "S-I";

	name0 -- course;
	code -- course;
	course -- "C-I" [label="n",len=1.00];
	"C-I" -- institute [label="1",len=1.00];
	institute -- name1;
	institute -- "S-I" [label="1",len=1.00];
	"S-I" -- student [label="n",len=1.00];
	student -- grade;
	student -- name2;
	student -- number;
	student -- "S-C" [label="m",len=1.00];
	"S-C" -- course [label="n",len=1.00];

	label = "\n\nEntity Relation Diagram\ndrawn by NEATO";
	fontsize=20;
}
~~~
