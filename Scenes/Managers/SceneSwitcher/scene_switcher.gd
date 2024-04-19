extends Node

var sceneStack = []
var gameEntryPointNode = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	gameEntryPointNode = get_node("/root/GameEntryPoint")

func instantiateScene(scenePath: String) -> Node:
	var packedScene = load(scenePath)
	var sceneInstance = packedScene.instantiate()
	return sceneInstance

func pushScene(sceneNode: Node) -> void:
	if sceneStack.size() > 0:
		gameEntryPointNode.remove_child(sceneStack.back())
	
	sceneStack.push_back(sceneNode)
	gameEntryPointNode.add_child(sceneNode)

func popScene() -> void:
	var currentSceneNode = sceneStack.pop_back()
	if currentSceneNode != null:
		gameEntryPointNode.remove_child(currentSceneNode)
		if sceneStack.size() > 0:
			var nodeToAdd = sceneStack.back()
			gameEntryPointNode.add_child(nodeToAdd)
		else:
			print("Scene popped, no scenes left in stack to replace it.")
	else:
		print("popScene called on empty scene stack")

func switchScene(sceneNode: Node) -> void:
	popScene()
	pushScene(sceneNode)

func instantiateAndPushScene(scenePath: String) -> void:
	var sceneInstance = instantiateScene(scenePath)
	pushScene(sceneInstance)

func instantiateAndSwitchToScene(scenePath: String) -> void:
	var sceneInstance = instantiateScene(scenePath)
	switchScene(sceneInstance)
