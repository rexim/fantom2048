using gfx

mixin IAnimation {
    abstract Void nextFrame(Int delay);
    abstract Void renderFrame(Graphics g);
    abstract Bool isOver();
}