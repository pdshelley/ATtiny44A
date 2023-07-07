@inlinable
public var INTERRUPT: @convention(c) () -> Void {
	get {
		return getINTERRUPT_cb()
	}
	set {
		setINTERRUPT_cb(newValue)
	}
}
