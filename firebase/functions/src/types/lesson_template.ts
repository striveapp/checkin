import {Master} from "./lessons";

export type LessonTemplate = {
    name: string,
    weekDay: string,
    timeStart: string,
    timeEnd: string,
    masters: Master[],
}