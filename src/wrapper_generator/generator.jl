using Clang

const K4A_INCLUDE_PATH = joinpath("/", "usr", "include", "k4a") |> normpath
const K4A_HEADERS = [joinpath(K4A_INCLUDE_PATH, header) for header in readdir(K4A_INCLUDE_PATH) if endswith(header, ".h")]

wc = init(; headers = K4A_HEADERS,
            output_file = joinpath(@__DIR__, "..", "wrapper", "k4a_api.jl"),
            common_file = joinpath(@__DIR__, "..", "wrapper", "k4a_common.jl"),
            clang_includes = vcat(K4A_INCLUDE_PATH, CLANG_INCLUDE),
            clang_args = ["-I", joinpath(K4A_INCLUDE_PATH, "..")],
            header_wrapped = (root, current)->root == current,
            header_library = x->"k4a",
            clang_diagnostics = true,
            )
run(wc)
