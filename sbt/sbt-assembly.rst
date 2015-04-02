sbt-assembly
##################


对于0.11.2版
================


在project目录加 assembly.sbt 写入：

$ cat project/assembly.sbt
addSbtPlugin("com.eed3si9n" % "sbt-assembly" % "0.11.2")


然后配置基础，因为spark包含了scala库所以不需要再次包含。



.. code-block:: scala

	import AssemblyKeys._

	name := "Simple Project"
	version := "1.0"
	organization := "com.databricks"
	scalaVersion := "2.10.4"
	libraryDependencies ++= Seq(

	    "org.apache.hadoop" % "hadoop-client" % "2.3.0" % "provided",
	    "org.apache.spark" %% "spark-core" % "1.3.0" % "provided"
		// Third-party libraries
		"net.sf.jopt-simple" % "jopt-simple" % "4.3",
		"joda-time" % "joda-time" % "2.0"
	)
	// This statement includes the assembly plug-in capabilities
	assemblySettings
	// Configure JAR used with the assembly plug-in
	jarName in assembly := "my-project-assembly.jar"
	// A special option to exclude Scala itself form our assembly JAR, since Spark
	// already bundles Scala.
	assemblyOption in assembly :=
	(assemblyOption in assembly).value.copy(includeScala = false)


对于0.13.0版
================


在project目录加 assembly.sbt 写入：
$ cat project/assembly.sbt
addSbtPlugin("com.eed3si9n" % "sbt-assembly" % "0.13.0")


.. code-block:: scala

	name := "hello"
	version := "1.0"
	scalaVersion := "2.10.4"

	libraryDependencies ++= Seq(

	    "org.apache.hadoop" % "hadoop-client" % "2.3.0" % "provided",
	    "org.apache.spark" %% "spark-core" % "1.3.0" % "provided"
	)

	// Configure JAR used with the assembly plug-in
	assemblyJarName  in assembly := "wordcount-assembly.jar"
	// A special option to exclude Scala itself form our assembly JAR, since Spark
	// already bundles Scala.
	assemblyOption in assembly :=
	(assemblyOption in assembly).value.copy(includeScala = false)
                                                                 