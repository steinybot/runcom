import sbt._
import Keys._
import sbt.internal.BuildStructure

object SbtUpdatesOnLoadPlugin extends AutoPlugin {

  override def trigger = allRequirements

  override def globalSettings: Seq[Setting[_]] = Seq(
    onLoad := {
      val old = (onLoad in Global).value
      dependencyUpdatesOnLoad _ compose old
    }
  )

  private def dependencyUpdatesOnLoad(state: State): State = {
    if (alreadyLoadedPlugins(state)) state
    else if (isMetaBuild(state)) "dependencyUpdates" :: state
    else "; dependencyUpdates; reload plugins; reload return" :: state
  }

  private def isMetaBuild(state: State): Boolean = {
    state.attributes.get(Keys.stateBuildStructure) match {
      case Some(structure) => structure.root.getPath.split("/").last == "project"
      case None => false
    }
  }

  private def alreadyLoadedPlugins(state: State): Boolean = {
    state.history.executed.exists(_.commandLine == "reload return")
  }
}
