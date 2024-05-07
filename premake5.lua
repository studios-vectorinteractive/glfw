project "glfw"
	kind "StaticLib"
    language "C"
	staticruntime "on"

	targetdir ("bin/" .. project().name .. "/%{cfg.buildcfg}")
	objdir ("bin-int/" .. project().name .. "/%{cfg.buildcfg}")

	files
	{
		"include/**.h",
		"src/**.h",
		"src/**.cpp",
		"src/**.c"
	}

	filter "system:windows"
		systemversion "latest"

		files
		{
			"include/**.h",
			"src/**.h",
			"src/**.cpp",
			"src/**.c"
		}

		defines
		{
			"_GLFW_WIN32",
			"_CRT_SECURE_NO_WARNINGS"
		}

	filter "configurations:Debug"
        symbols "On"
		buildoptions "/MDd"

    filter "configurations:Release"
        optimize "On"
		buildoptions "/MD"

