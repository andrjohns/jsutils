import { parseScript, parseModule, tokenize } from "esprima";

globalThis.esprima = { parseScript, parseModule, tokenize };
